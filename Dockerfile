# Step 1: Use an official Python runtime as a parent image
FROM python:3.8-slim

# Step 2: Set the working directory in the container
WORKDIR /usr/src/app

# Step 3: Copy the current directory contents into the container at /usr/src/app
COPY . .

# Step 4: Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Make port 5000 available to the world outside this container
EXPOSE 5000

# Step 6: Define environment variable
ENV FLASK_APP=core/server.py
ENV FLASK_RUN_HOST=0.0.0.0

# Step 7: Run app.py when the container launches
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "--log-level", "debug","core.server:app"]