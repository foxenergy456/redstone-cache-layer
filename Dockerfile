# This Dockerfile contains a docker container configuration
# for redstone cache layer express app connected to the Mongo DB
# Mongo DB connection url must be specified in .secrets.json file

FROM public.ecr.aws/lambda/nodejs:14

WORKDIR /var/task/

COPY package.json package.json
COPY yarn.lock yarn.lock
RUN npm i -g yarn
RUN yarn

COPY . .

ENV MODE=PROD

CMD [ "index.handler" ]
