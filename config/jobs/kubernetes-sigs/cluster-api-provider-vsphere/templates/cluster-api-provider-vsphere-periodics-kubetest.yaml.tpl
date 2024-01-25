{{- if eq .branch "main" }}
periodics:

# original job: https://github.com/kubernetes/test-infra/blob/92927d1abec1c3c78e396356e1bbaf19f9e2b699/config/jobs/kubernetes/sig-cloud-provider/gcp/gcp-gce.yaml#L713
- name: periodic-cluster-api-provider-vsphere-upstream-e2e-alpha-features
  labels:
    preset-dind-enabled: "true"
    preset-cluster-api-provider-vsphere-e2e-config: "true"
    preset-cluster-api-provider-vsphere-gcs-creds: "true"
    preset-kind-volume-mounts: "true"
  interval: 168h # one week
  decorate: true
  decoration_config:
    timeout: 200m
  rerun_auth_config:
    github_team_slugs:
    - org: kubernetes-sigs
      slug: cluster-api-provider-vsphere-maintainers
  extra_refs:
  - org: kubernetes-sigs
    repo: cluster-api-provider-vsphere
    base_ref: {{ $.branch }}
    path_alias: sigs.k8s.io/cluster-api-provider-vsphere
  spec:
    containers:
    - image: {{ $.config.TestImage }}
      command:
      - runner.sh
      args:
      - ./hack/e2e.sh
      env:
      - name: GINKGO_FOCUS
        value: "\\[Conformance\\]"
      - name: KUBETEST_CONFIGURATION
        value: ./data/kubetest/upstream-e2e-alpha-features.yaml
      - name: KUBETEST_GINKGO_NODES
        value: "1"
      # we need privileged mode in order to do docker in docker
      securityContext:
        privileged: true
        capabilities:
          add: ["NET_ADMIN"]
      resources:
        requests:
          cpu: "4000m"
          memory: "6Gi"
  annotations:
    testgrid-dashboards: vmware-cluster-api-provider-vsphere, sig-cluster-lifecycle-cluster-api-provider-vsphere
    testgrid-tab-name: periodic-upstream-e2e-alpha-features
    testgrid-alert-email: sig-cluster-lifecycle-cluster-api-vsphere-alerts@kubernetes.io
    testgrid-num-failures-to-alert: "4"
    description: Runs upstream e2e alpha-features tests

# original jobs: https://github.com/kubernetes/test-infra/blob/92927d1abec1c3c78e396356e1bbaf19f9e2b699/config/jobs/kubernetes/sig-cloud-provider/gcp/gcp-gce.yaml#L857
- name: periodic-cluster-api-provider-vsphere-upstream-e2e-serial
  labels:
    preset-dind-enabled: "true"
    preset-cluster-api-provider-vsphere-e2e-config: "true"
    preset-cluster-api-provider-vsphere-gcs-creds: "true"
    preset-kind-volume-mounts: "true"
  interval: 168h # one week
  decorate: true
  decoration_config:
    timeout: 520m
  rerun_auth_config:
    github_team_slugs:
    - org: kubernetes-sigs
      slug: cluster-api-provider-vsphere-maintainers
  extra_refs:
  - org: kubernetes-sigs
    repo: cluster-api-provider-vsphere
    base_ref: {{ $.branch }}
    path_alias: sigs.k8s.io/cluster-api-provider-vsphere
  spec:
    containers:
    - image: {{ $.config.TestImage }}
      command:
      - runner.sh
      args:
      - ./hack/e2e.sh
      env:
      - name: GINKGO_FOCUS
        value: "\\[Conformance\\]"
      - name: KUBETEST_CONFIGURATION
        value: ./data/kubetest/upstream-e2e-serial.yaml
      - name: KUBETEST_GINKGO_NODES
        value: "1"
      # we need privileged mode in order to do docker in docker
      securityContext:
        privileged: true
        capabilities:
          add: ["NET_ADMIN"]
      resources:
        requests:
          cpu: "4000m"
          memory: "6Gi"
  annotations:
    testgrid-dashboards: vmware-cluster-api-provider-vsphere, sig-cluster-lifecycle-cluster-api-provider-vsphere
    testgrid-tab-name: periodic-upstream-e2e-serial
    testgrid-alert-email: sig-cluster-lifecycle-cluster-api-vsphere-alerts@kubernetes.io
    testgrid-num-failures-to-alert: "4"
    description: Runs upstream e2e serial tests

# original job: https://github.com/kubernetes/test-infra/blob/92927d1abec1c3c78e396356e1bbaf19f9e2b699/config/jobs/kubernetes/sig-cloud-provider/gcp/gcp-gce.yaml#L896
- name: periodic-cluster-api-provider-vsphere-upstream-e2e-slow
  labels:
    preset-dind-enabled: "true"
    preset-cluster-api-provider-vsphere-e2e-config: "true"
    preset-cluster-api-provider-vsphere-gcs-creds: "true"
    preset-kind-volume-mounts: "true"
  interval: 168h # one week
  decorate: true
  decoration_config:
    timeout: 170m
  rerun_auth_config:
    github_team_slugs:
    - org: kubernetes-sigs
      slug: cluster-api-provider-vsphere-maintainers
  extra_refs:
  - org: kubernetes-sigs
    repo: cluster-api-provider-vsphere
    base_ref: {{ $.branch }}
    path_alias: sigs.k8s.io/cluster-api-provider-vsphere
  spec:
    containers:
    - image: {{ $.config.TestImage }}
      command:
      - runner.sh
      args:
      - ./hack/e2e.sh
      env:
      - name: GINKGO_FOCUS
        value: "\\[Conformance\\]"
      - name: KUBETEST_CONFIGURATION
        value: ./data/kubetest/upstream-e2e-slow.yaml
      - name: KUBETEST_GINKGO_NODES
        value: "25"
      # we need privileged mode in order to do docker in docker
      securityContext:
        privileged: true
        capabilities:
          add: ["NET_ADMIN"]
      resources:
        requests:
          cpu: "4000m"
          memory: "6Gi"
  annotations:
    testgrid-dashboards: vmware-cluster-api-provider-vsphere, sig-cluster-lifecycle-cluster-api-provider-vsphere
    testgrid-tab-name: periodic-upstream-e2e-slow
    testgrid-alert-email: sig-cluster-lifecycle-cluster-api-vsphere-alerts@kubernetes.io
    testgrid-num-failures-to-alert: "4"
    description: Runs upstream e2e slow tests

# original job: https://github.com/kubernetes/test-infra/blob/92927d1abec1c3c78e396356e1bbaf19f9e2b699/config/jobs/kubernetes/sig-cloud-provider/gcp/gcp-gce.yaml#L581
- name: periodic-cluster-api-provider-vsphere-upstream-e2e
  labels:
    preset-dind-enabled: "true"
    preset-cluster-api-provider-vsphere-e2e-config: "true"
    preset-cluster-api-provider-vsphere-gcs-creds: "true"
    preset-kind-volume-mounts: "true"
  interval: 168h # one week
  decorate: true
  decoration_config:
    timeout: 70m
  rerun_auth_config:
    github_team_slugs:
    - org: kubernetes-sigs
      slug: cluster-api-provider-vsphere-maintainers
  extra_refs:
  - org: kubernetes-sigs
    repo: cluster-api-provider-vsphere
    base_ref: {{ $.branch }}
    path_alias: sigs.k8s.io/cluster-api-provider-vsphere
  spec:
    containers:
    - image: {{ $.config.TestImage }}
      command:
      - runner.sh
      args:
      - ./hack/e2e.sh
      env:
      - name: GINKGO_FOCUS
        value: "\\[Conformance\\]"
      - name: KUBETEST_CONFIGURATION
        value: ./data/kubetest/upstream-e2e.yaml
      - name: KUBETEST_GINKGO_NODES
        value: "30"
      # we need privileged mode in order to do docker in docker
      securityContext:
        privileged: true
        capabilities:
          add: ["NET_ADMIN"]
      resources:
        requests:
          cpu: "4000m"
          memory: "6Gi"
  annotations:
    testgrid-dashboards: vmware-cluster-api-provider-vsphere, sig-cluster-lifecycle-cluster-api-provider-vsphere
    testgrid-tab-name: periodic-upstream-e2e
    testgrid-alert-email: sig-cluster-lifecycle-cluster-api-vsphere-alerts@kubernetes.io
    testgrid-num-failures-to-alert: "4"
    description: Runs upstream e2e tests
{{ end -}}