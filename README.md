# Automação para criação de Organizações no grafana

A finalidade dessa automação é auxiliar quem administra varias organizações na criação de novas mante os usuários administradores sempre com permissão.

### Há 3 roles com tags no arquivo main.yml 
- **create-org** - cria uma nova organização, o nome deve ser passado.
- **create-datasource-zabbix** - cria uma novo datasource para o Zabbix na organização informada.
- **create-datasource-mysql-role** - cria uma novo datasource para o Mysql na organização informad.
- **associate-admin-users** - associa usuários de uma determinada organização raiz a essa organização.


## Dica de uso

Chame as role através das tags, passando sempreo com --extra-vars o nome da organi:

```bash
>$ ansible-playbook -i hosts main.yml --tags "create-org-role" --vault-password-file ~/.vault_key --extra-vars "org_name='Org teste 1'"
```