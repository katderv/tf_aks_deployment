from fastapi import FastAPI
import time

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Automate all the things!", "timestamp": int(time.time())}