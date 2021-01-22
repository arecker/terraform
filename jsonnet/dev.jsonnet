local chores = import 'chores.jsonnet';
local a = import 'lib/ansible.libsonnet';

local hosts = {
  [chores.hostname]: chores.port,
};

local tasks = [
  a.template(
    name='hosts.j2',
    dest='/etc/hosts',
    become=true,
    variables=hosts,
    mode='0644',
  ),
  a.packages([
    'git',
    'nfs-common',
    'nginx',
    'python3',
    'python3-pip',
    'python3-setuptools',
    'python3-venv',
  ]),
  a.directories([
    '~/.config/systemd/user/',
    '~/bin',
    '~/envs',
    '~/mnt',
    '~/src',
    '~/venvs',
  ]),
  a.mount(url='nas.local:/volume1/dev', path='/home/alex/mnt'),
  a.template(
    name='nginx.conf.j2',
    dest='/etc/nginx/nginx.conf',
    become=true,
    variables=hosts,
  ),
];

[
  {
    name: 'dev server',
    hosts: 'dev.local',
    remote_user: 'alex',
    tasks: tasks,
  },
]
