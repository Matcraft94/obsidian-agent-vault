# Lessons: Testing

## Key Patterns

### Test Organization
- **Unit tests**: Pure functions, no DB access, fast (< 50ms)
- **Integration tests**: API endpoints with DB, test data flow
- **E2E tests**: Critical user flows, Playwright-based

### Test Before Document Count
**CRITICAL**: Never state test counts without verification.

```bash
# Verify counts exist
pytest --collect-only -k "<pattern>"

# Count actual tests
./scripts/count-tests.sh
```

### Tests Must Exist Before Marking Complete
**Anti-Pattern**: Aspirational Test Lists
- ❌ Listing tests you plan to write
- ❌ Documenting test counts from memory
- ✅ Writing tests first (TDD)
- ✅ Verifying with `--collect-only` before documentation

### Testing Checklist for New Features

Before marking feature complete:
- [ ] Unit tests for domain logic (pure Python, no Django)
- [ ] Integration tests for service layer
- [ ] API tests for endpoints (status codes, response format)
- [ ] E2E tests for critical user flows
- [ ] Edge cases covered (empty inputs, nulls, boundaries)
- [ ] Error paths tested (exceptions, HTTP error codes)
- [ ] RLS tests for multi-tenant operations
- [ ] Performance tests if applicable

### Coverage Requirements
- **Minimum**: 80% coverage
- **Domain layer**: 90%+ (pure logic, easy to test)
- **Services**: 80%+ (business logic)
- **API**: 70%+ (thin layer, delegates to services)

**Never hardcode coverage numbers** - generate from actual runs:
```bash
docker compose exec web pytest --cov=apps --cov-report=term-missing
```

### Verification Commands

```bash
# All tests
docker compose exec web pytest

# Specific test patterns
docker compose exec web pytest apps/evaluations/tests/test_api_*.py -v
docker compose exec web pytest apps/evaluations/tests/test_domain_*.py
docker compose exec web pytest apps/core/tests/test_rls.py -v -m rls

# By name
docker compose exec web pytest -k "test_submit_auto"

# Single test by path
docker compose exec web pytest apps/evaluations/tests/test_api_evaluations.py::TestEvaluationViewSet::test_create -v

# With coverage
docker compose exec web pytest --cov=apps

# Frontend tests
docker compose exec frontend npm run test:unit
docker compose exec frontend npx playwright test e2e/
```

## Common Mistakes

1. **Missing Integration Tests**: New features without testing the complete flow
2. **Test Drift**: Tests not updated when code changes
3. **False Positives**: Tests that don't actually verify behavior
4. **Slow Tests**: Tests that take > 1 second without good reason
5. **Brittle Tests**: Tests that break on minor implementation changes
6. **Missing Edge Cases**: Only testing happy path
7. **No RLS Coverage**: Multi-tenant features without RLS tests
8. **Documentation Without Verification**: Stating test counts that don't exist

## Test Data Management

### Fixtures
- Use `conftest.py` for shared fixtures
- Use factories (FactoryBoy) for test data generation
- Never use production data in tests

### Database State
- Each test starts with clean database
- Use `@pytest.mark.django_db` for DB tests
- Use `transaction=True` for tests that modify DB

### Mocking
- Mock external services/APIs
- Don't mock what you own (test your actual code)
- Use `unittest.mock` or `pytest-mock`

## RLS Testing

All multi-tenant operations require RLS context:
```python
@pytest.fixture
def in_tenant_a():
    return set_tenant_context(tenant_id='tenant-a')

@pytest.fixture
def as_superuser():
    return set_user_context(is_superuser=True)
```

## TDD Workflow

1. **RED**: Write failing test first
2. **GREEN**: Write minimal code to pass test
3. **REFACTOR**: Improve code while keeping tests green
4. **COVERAGE**: Verify 80%+ before marking complete

## Corrections Applied

<!-- Add corrections here as they happen -->

- 2026-03-08: Added comprehensive testing checklist and verification commands
- 2026-03-08: Documented anti-pattern of aspirational test lists
