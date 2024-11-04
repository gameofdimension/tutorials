ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND noninteractive

# Install common dependencies (so that this step can be cached separately)
COPY ./common/install_base.sh install_base.sh
RUN bash ./install_base.sh && rm install_base.sh

# Setup user
# TODO: figure out how to remove this part
COPY ./common/install_user.sh install_user.sh
RUN bash ./install_user.sh && rm install_user.sh

COPY ./common/install_docs_reqs.sh install_docs_reqs.sh
RUN bash ./install_docs_reqs.sh && rm install_docs_reqs.sh

COPY ./common/install_python.sh install_python.sh
COPY ./requirements.txt requirements.txt
RUN bash ./install_python.sh && rm install_python.sh

# Install conda and other packages
# ENV ANACONDA_PYTHON_VERSION=3.10
# ENV CONDA_CMAKE yes
ENV DOCS yes
# ENV PATH /opt/conda/envs/py_$ANACONDA_PYTHON_VERSION/bin:/opt/conda/bin:$PATH
# COPY ./common/install_conda.sh install_conda.sh
# COPY ./common/common_utils.sh common_utils.sh
# RUN bash ./install_conda.sh && rm install_conda.sh common_utils.sh /opt/conda/requirements.txt
ENV PATH /opt/venv/py310/tutorials/bin:$PATH

USER ci-user
CMD ["bash"]
