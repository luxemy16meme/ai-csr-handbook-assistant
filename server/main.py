from config import *
from query import load_vector_store, search

vectorstore = load_vector_store(VECTOR_STORE_PATH, EMBED_MODEL)

while True:
    q = input("Ask a question (type exit): ")
    if q.lower() in ["exit", "quit"]:
        break

    results = search(q, vectorstore)
    for i, r in enumerate(results, 1):
        print(f"\nResult {i}:\n{r.page_content[:300]}...")
