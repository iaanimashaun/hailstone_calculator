# from fastapi import FastAPI
import fastapi
import uvicorn

# from fastapi.responses import JSONResponse
from src.hailstone_calculator.calculator import calculate_hailstone_sequence

# app = FastAPI()
app = fastapi.FastAPI()

# @app.get("/hailstone/")
# async def read_root():
#     return {"Hello": "hailstone"}

@app.get("/test")
async def test():
    return {"Hello": "Test"}


@app.get("/hailstone")
async def hailstone_sequence(starting_number: int):
    result = calculate_hailstone_sequence(starting_number)
    return result
    # return JSONResponse(result)


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
