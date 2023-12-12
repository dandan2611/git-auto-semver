FROM ubuntu:22.04

LABEL "com.github.actions.name" = "Git Automatic Semantic Versioning"
LABEL "com.github.actions.description"="Automatically create new semantci version string based on commit message"


LABEL version=$IMAGE_VERSION
LABEL repository="https://github.com/bitshifted/git-auto-semver"
LABEL maintainer="Bitshift"

COPY scripts/entrypoint.sh /usr/bin
RUN chmod 755 /usr/bin/entrypoint.sh
RUN apt update && apt install -y git jq

ENTRYPOINT ["/usr/bin/entrypoint.sh"]