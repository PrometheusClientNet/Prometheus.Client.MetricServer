#!/bin/bash

if ${APPVEYOR_REPO_TAG} == "true"  ; then
  echo "Pack for NuGet"
  dotnet pack ${APPVEYOR_BUILD_FOLDER}/src/Prometheus.Client.MetricServer -c Release --include-symbols --no-build -o artifacts/nuget
  dotnet pack ${APPVEYOR_BUILD_FOLDER}/src/Prometheus.Client.MetricServer.Kestrel -c Release --include-symbols --no-build -o artifacts/nuget
else
  echo "Pack for MyGet"
  dotnet pack ${APPVEYOR_BUILD_FOLDER}/src/Prometheus.Client.MetricServer -c Release --include-symbols --no-build --version-suffix build${APPVEYOR_BUILD_NUMBER} -o artifacts/myget
  dotnet pack ${APPVEYOR_BUILD_FOLDER}/src/Prometheus.Client.MetricServer.Kestrel -c Release --include-symbols --no-build --version-suffix build${APPVEYOR_BUILD_NUMBER} -o 
  artifacts/myget
fi
