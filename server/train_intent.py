import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from langchain_huggingface import HuggingFaceEmbeddings
import joblib

df = pd.read_csv("data/intent.csv")

questions = df["questions"].tolist()
labels = df["label"].tolist()

embedder = HuggingFaceEmbeddings(
    model_name="sentence-transformers/paraphrase-MiniLM-L3-v2"
)

X = embedder.embed_documents(questions)
y = labels

model = LogisticRegression()
model.fit(X,y)

joblib.dump(model, "intent_classifier.pkl")

print("Intent classifier trained and saved!")