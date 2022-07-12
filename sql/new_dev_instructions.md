<!--
 Copyright (C) 2022 José Enrique Vilca Campana

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Affero General Public License as
 published by the Free Software Foundation, either version 3 of the
 License, or (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Affero General Public License for more details.

 You should have received a copy of the GNU Affero General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->

sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql.service

<!-- or -->
sudo service postgresql-9.3 initdb #Initialize the server
sudo /etc/init.d/postgresql start #Start the server
<!-- end or -->

sudo -i -u postgres
<!-- to access the Postgresql prompt use -->
psql
<!-- to exit the Postgresql prompt use -->
\q
<!-- now you are at the Postgres Linux command prompt. To return to the regular system user, exit with: -->
exit


A more direct way
<!-- run psql as the postgres account -->
sudo -u postgres psql
<!-- to exit use -->
\q


## How to Change a Password for the User in PostgreSQL?


1. Login into the psql:

```bash
sudo -u postgres psql
```


2. Then in the psql console change the password and quit:

```psql bash
postgres=# \password postgres
Enter new password: <new-password>
postgres=# \q
```

```psql bash
alter user <user-name> with password <new-password>;
```
or use a query
```sql
ALTER USER postgres PASSWORD '<new-password>';
```

or in one line
```bash
sudo -u postgres psql -c "ALTER USER postgres PASSWORD '<new-password>';"
```


## How to Delete a Password for the User in PostgreSQL?

```psql bash
alter user <user_name> with <new-password> null;
```














## References
- https://stackoverflow.com/questions/12720967/how-to-change-postgresql-user-password?answertab=trending#tab-top
- 

