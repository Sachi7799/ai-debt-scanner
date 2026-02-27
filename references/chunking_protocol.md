# Chunked Analysis Protocol

When a file is flagged with `[CHUNK REQ]` (Estimated > 1000 tokens), the agent MUST follow this analysis protocol to avoid context saturation and maintain coherence.

## Segmentation Parameters
*   **Chunk Size**: ~1000 tokens (Approx. 4000 characters or 150-200 lines of code).
*   **Overlap**: ~100 tokens (Approx. 400 characters or 20 lines).
*   **Validation Limits**: Each interaction should stay within model-specific sweet spots for deep reasoning (<10k tokens).

## Workflow

### 1. Initial Structure Overview
Before processing chunks, obtain the global file structure (imports, main class/function names) to build a mental map.

### 2. Iterative Chunk Processing
For large files, use `read_file` with `offset` and `limit` sequentially:

*   **Chunk 1**: `offset: 0`, `limit: 200`
*   **Chunk 2**: `offset: 180` (20-line overlap), `limit: 200`
*   ... until the end of the file.

### 3. Synthesis of Findings
*   Identify violations crossing chunk boundaries.
*   Keep track of global variables or shared states.

### 4. Surgical Resolution
Propose changes focusing on the specific chunk. If a change requires modifying distant parts of the file, perform them in sequentially validated steps.
