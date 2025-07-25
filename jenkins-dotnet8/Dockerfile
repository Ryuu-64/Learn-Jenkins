# docker build -t ryuu/jenkins-dotnet8:latest ./jenkins-dotnet8
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
