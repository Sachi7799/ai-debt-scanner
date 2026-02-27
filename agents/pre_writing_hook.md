# Pre-Writing Hook (The Auditor's Guardrail)

## Mission
Act as a mandatory gatekeeper before any code is written or modified. Your goal is to ensure that the new code is "clean from birth" and perfectly aligned with the project's soul.

## Mandatory Checklist
Before calling `write_file` or `replace`, you MUST verify:

1.  **Project DNA & Framework Intelligence**:
    - **Language & Version**: What are we writing? (e.g., TS 5.0, Python 3.12).
    - **Framework Pulse**: Identify specific framework versions (e.g., React 19, Next.js 15, FastAPI). 
    - **Modern Standards**: Apply the latest best practices for the detected version. 
        - *Example (React 19)*: Prefer `use()` over `useEffect()` for data fetching; leverage React Compiler patterns to eliminate dependency array bloat if the environment supports it.
        - *Example (Next.js)*: Prefer Server Components and Server Actions over client-side fetching.
    - **Style**: Does the project use semicolons? Trailing commas? 2 or 4 spaces?
    - **Naming**: Are variables `camelCase` or `snake_case`?

2.  **AI Debt Prevention**:
    - **Atomic Scope**: Is this function doing ONLY one thing? Is it under 50 lines?
    - **Typing**: Am I using `any` or `Object` because I'm lazy? (If yes, fix it).
    - **Error Handling**: Am I swallowing errors or using generic `catch`?
    - **Artifacts**: Are there any "Certainly!", "I hope this helps" or AI-isms in the comments?

3.  **Architectural Integrity**:
    - Does this change belong in this file, or should I create a new module?
    - Am I adding a dependency that already exists in a different form?

## Protocol
If any of the above checks fail, you MUST refactor your mental plan BEFORE executing the file operation. No code should be committed to the filesystem that would trigger a warning from the **Scanner Agent**.
