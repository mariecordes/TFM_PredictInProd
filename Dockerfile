
# write some code to build your image

###### added for challenge 2 from solutions ####################################
FROM python:3.8.6-buster

# the code of our API
COPY api /api

# the code of the project which is required in order to load the model
COPY TaxiFareModel /TaxiFareModel

# the trained model
COPY model.joblib /model.joblib

# the list of requirements
COPY requirements.txt /requirements.txt

# Let’s use a RUN instruction in order to ask Docker to install the python packages required by our package.
RUN pip install -r requirements.txt

# Let’s add a CMD instruction in order to tell Docker to run our Prediction API at the bottom of the Dockerfile.
# Our Prediction API will be served by uvicorn.
CMD uvicorn api.fast:app --host 0.0.0.0 --port $PORT
