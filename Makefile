.DEFAULT_GOAL := ins

.SILENT:
use_ctx:
	kubectl config use-context sfs

.SILENT:
install:
	kubectl config use-context sfs
	helmfile apply

.SILENT:
ins:
	kubectl config use-context sfs
	helmfile apply -q -l rel=$(r)

.SILENT:
uninstall:
	kubectl config use-context sfs
	helmfile destroy

.SILENT:
uninst:
	kubectl config use-context sfs
	helmfile destroy -l rel=$(r)

.SILENT:
prune_pods:
	kubectl config use-context sfs
	kubectl delete pod --field-selector=status.phase=Succeeded --all-namespaces
	kubectl delete pod --field-selector=status.phase=Failed --all-namespaces

.SILENT:
rd:
	kubectl config use-context sfs
	kubectl rollout restart deploy $(n)

.SILENT:
rds:
	kubectl config use-context sfs
	kubectl rollout restart daemonset $(n)

.SILENT:
rss:
	kubectl config use-context sfs
	kubectl rollout restart statefulset $(n)
