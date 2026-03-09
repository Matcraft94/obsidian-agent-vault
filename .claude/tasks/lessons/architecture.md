# Lessons: Architecture

## Key Patterns

### ADR Process (Architecture Decision Records)

**Mandatory for all architectural decisions:**
1. Document decision BEFORE implementation
2. Include: Context, Decision, Consequences (+/-)
3. Update status: proposed → accepted → deprecated → superseded

**Status Flow:**
- 🟡 **proposed**: Decision being considered
- 🟢 **accepted**: Decision approved and being implemented
- 🔴 **rejected**: Decision considered but not accepted
- ⚪ **deprecated**: Decision no longer relevant
- 🔄 **superseded**: Replaced by newer ADR (link to replacement)

### Clean Architecture Rules

**Layer Separation (mandatory):**

| Layer | Responsibility | Imports Allowed |
|-------|----------------|-----------------|
| **Domain** (`domain/`) | Pure business logic, value objects, FSMs | Standard library only |
| **Services** (`services/`) | Business logic orchestration | Django ORM, domain layer |
| **API** (`api/`) | HTTP interface, thin layer | DRF, services layer |

**Domain Layer Rules:**
- Zero Django imports (pure Python)
- Value objects: immutable, validated on creation
- FSMs: state transitions defined explicitly
- Exceptions: domain-specific, inherit from base DomainError

**Services Layer Rules:**
- Stateless classes with `@classmethod` methods
- Use `@transaction.atomic` for write operations
- Private helpers are `@staticmethod`
- Decorator stacking: `@classmethod` on top

**API Layer Rules:**
- Thin layer - no business logic
- Delegate to services for all operations
- Handle HTTP concerns only (status codes, serialization)
- Use exception handler to map domain errors to HTTP

## Required Documentation per Feature Type

### Backend Feature
- [ ] Domain logic documented (if complex)
- [ ] Service methods annotated
- [ ] API endpoints with OpenAPI specs
- [ ] ADR if architectural decision

### Frontend Feature
- [ ] Component architecture documented
- [ ] Store/state management explained
- [ ] API integration pattern documented
- [ ] TypeScript types defined

### Database Change
- [ ] Schema changes in migration
- [ ] Indexing strategy documented
- [ ] RLS policies updated (if multi-tenant)
- [ ] ADR if significant change

### API Change
- [ ] OpenAPI schema updated
- [ ] Versioning considered
- [ ] Breaking changes documented
- [ ] Migration guide if breaking

## Common Mistakes

1. **Implementation Before ADR**: Coding before documenting decision
2. **Domain Pollution**: Django imports in domain layer
3. **Service Bloat**: Business logic in API/views instead of services
4. **Missing Abstraction**: Direct ORM calls scattered throughout code
5. **God Classes**: Services or views with too many responsibilities
6. **Tight Coupling**: Direct imports between modules (use signals/events)
7. **Premature Abstraction**: Over-engineering simple features
8. **No State Machines**: Complex state logic without FSMs

## Architecture Decision Checklist

Before implementing:
- [ ] ADR created with Context, Decision, Consequences
- [ ] Alternatives considered and documented
- [ ] Team review completed
- [ ] Decision status: proposed
- [ ] Related topics/MOCs updated

After implementation:
- [ ] ADR status updated to accepted
- [ ] Implementation matches ADR
- [ ] Code review passed
- [ ] Documentation updated

## Module Boundaries

**Enforced by import rules:**
- NO direct imports between apps (except `core`)
- Use Django signals for cross-module communication
- Use service layer for intra-app communication

## FSM (Finite State Machine) Pattern

**Required for complex state transitions:**
```python
class EvaluationState(str, Enum):
    DRAFT = "draft"
    CONFIGURED = "configured"
    ACTIVE = "active"
    CLOSED = "closed"
    ARCHIVED = "archived"

_TRANSITIONS = {
    EvaluationState.DRAFT: {EvaluationState.CONFIGURED},
    EvaluationState.CONFIGURED: {EvaluationState.ACTIVE},
    # ...
}
```

## Value Object Pattern

**Immutable, validated on creation:**
```python
@dataclass(frozen=True)
class Weight:
    value: Decimal
    
    def __post_init__(self):
        if not (0 <= self.value <= 1):
            raise DomainError("Weight must be between 0 and 1")
```

## Corrections Applied

<!-- Add corrections here as they happen -->

- 2026-03-08: Expanded ADR process with status flow
- 2026-03-08: Documented required documentation per feature type
