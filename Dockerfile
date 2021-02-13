FROM arches:5.1.0

RUN useradd arches
RUN chgrp arches ../entrypoint.sh && chmod g+rx ../entrypoint.sh
ARG ARCHES_PROJECT
ENV ARCHES_PROJECT $ARCHES_PROJECT
COPY ${ARCHES_PROJECT} entrypoint.sh ${WEB_ROOT}/${ARCHES_PROJECT}/
WORKDIR ${WEB_ROOT}/${ARCHES_PROJECT}/${ARCHES_PROJECT}
RUN yarn install
ENTRYPOINT ../entrypoint.sh
USER 1000
