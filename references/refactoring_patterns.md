# AI Refactoring Patterns

Guidelines for transforming "vibe coding debt" into idiomatic, maintainable code.

## 1. Large Functions -> Decomposition
**Issue**: AI tends to write >50 line functions handling multiple responsibilities.

❌ **Bad (AI-style)**:
```python
def process_data(data):
    # logic for validation (20 lines)
    # logic for transformation (30 lines)
    # logic for db saving (10 lines)
    pass
```

✅ **Good**:
```python
def process_data(data):
    validate_data(data)
    transformed = transform_data(data)
    save_to_db(transformed)
```

## 2. Empty Catches -> Resilient Error Handling
**Issue**: Empty `catch` blocks or generic exceptions used as a "quick fix".

❌ **Bad (AI-style)**:
```typescript
try {
  doSomething();
} catch (e) {
  // ignore
}
```

✅ **Good**:
```typescript
try {
  doSomething();
} catch (error) {
  if (error instanceof ValidationError) {
    logger.warn("Validation failed", { error });
    return;
  }
  throw error; // Propagate unexpected errors
}
```

## 3. Structural Bloat -> Module Extraction
**Issue**: Files >300 lines.
**Solution**: Identify sub-domains (helpers, types, API calls) and move them to dedicated files.
