FROM nousresearch/hermes-agent:latest
ENV HERMES_HOME=/opt/data
EXPOSE 7860
CMD ["gateway","run"]
