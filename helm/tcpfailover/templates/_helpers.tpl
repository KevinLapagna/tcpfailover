{{/*
Expand the name of the chart.
*/}}
{{- define "tcpfailover.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tcpfailover.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tcpfailover.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tcpfailover.labels" -}}
helm.sh/chart: {{ include "tcpfailover.chart" . }}
{{ include "tcpfailover.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tcpfailover.selectorLabels" -}}
app: {{ include "tcpfailover.name" . }}
app.kubernetes.io/name: {{ include "tcpfailover.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: {{ include "tcpfailover.name" . }}
app.kubernetes.io/part-of: {{ include "tcpfailover.name" . }}-app
{{- end }}

{{/*
Service ports
*/}}
{{- define "tcpfailover.servicePorts" -}}
{{- range .Values.proxies }}
- name: {{ .name }}
  port: {{ .externalPort }}
  targetPort: {{ .internalPort }}
{{- end }}
{{- end }}