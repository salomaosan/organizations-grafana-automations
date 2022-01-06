# Orquestração no Grafana

Esse playbook tem a finalidade de auxiliar quem administra varias organizações no Grafana e necessita mantê-las atualizados.

### Há 3 roles com tags no arquivo main.yml 
- **list-orgs** - lista todas as organizações e as grava no arquivo ./host_vars/organizations.yml.
- **create-datasource** - Cria datasources MySQL nas organizações listadas no anterior.
- **update-dashboard** -  (Em Desenvolvimento)


## Dica de uso

Chame as role através das tags:

```python
>$ ansible-playbook -i hosts main.yml --tags "list-orgs-role"
```
