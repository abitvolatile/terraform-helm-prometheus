# cAdvisor

Installs [cAdvisor](https://github.com/google/cadvisor), which provides users an understanding of the resource usage and performance characteristics of running containers within a Kubernetes cluster. This chart includes multiple components that are fairly static in design.

- [cAdvisor](https://github.com/google/cadvisor)



## Introduction

This chart deploys the [cAdvisor](https://github.com/google/cadvisor) resources on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager. Once deployed Prometheus should begin to ingest the metrics provided by cAdvisor's DaemonSet pods referenced via the PodMonitor resource. 


## Prerequisites
  - Kubernetes >= 1.15.x [Link](http://kubernetes.io)
  - Helm >= 3.1.x [Link](https://helm.sh/))
  - Prometheus-Operator >= 0.38.0 [Link](https://github.com/coreos/prometheus-operator)
