FROM microsoft/windowsservercore
MAINTAINER Matt Briggs (mabriggs@microsoft.com)

COPY azure-stack-install-ps.ps1 c:/install/
RUN powershell c:/install/azure-stack-install-ps.ps1