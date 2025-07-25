# docker build -f docker/images/jenkins-dotnet8.Dockerfile -t ryuu/jenkins-dotnet8:lts docker/images

FROM jenkins/jenkins:lts

USER root

# .NET SDK 8.0
RUN apt-get update && \
    apt-get install -y wget apt-transport-https curl gnupg && \
    wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y dotnet-sdk-8.0 && \
    rm -rf /var/lib/apt/lists/*

USER jenkins

CMD ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
