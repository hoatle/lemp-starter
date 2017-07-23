#
# Cookbook:: lemp-starter
# Recipe:: setup_lemp_starter
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# we need this because the guest path could change in the future
# instead of ~/workspace, it's likely that we'll use /mnt/workspace
cwd_path = node['acme']['lemp-starter']['project_guest_path']


execute 'docker-compose pull --ignore-pull-failures --parallel' do
    cwd cwd_path
    command 'docker-compose pull --ignore-pull-failures --parallel'
end


# get the dev service up by default
execute 'docker-compose up -d' do
    cwd cwd_path
    command 'docker-compose up -d'
end
