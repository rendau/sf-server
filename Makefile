.DEFAULT_GOAL := ins

.SILENT:
use_ctx:
	kubectl config use-context qoqoh

.SILENT:
install: use_ctx
	helmfile apply

.SILENT:
ins: use_ctx
	helmfile apply -q -l rel=$(r)

.SILENT:
uninstall: use_ctx
	helmfile destroy

.SILENT:
uninst: use_ctx
	helmfile destroy -l rel=$(r)

.SILENT:
prune_pods: use_ctx
	kubectl delete pod --field-selector=status.phase=Succeeded --all-namespaces
	kubectl delete pod --field-selector=status.phase=Failed --all-namespaces

.SILENT:
rd: use_ctx
	kubectl rollout restart deploy $(n)

.SILENT:
rds: use_ctx
	kubectl rollout restart daemonset $(n)

.SILENT:
rss: use_ctx
	kubectl rollout restart statefulset $(n)
