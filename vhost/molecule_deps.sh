if [ ! -d .molecule/roles ]; then
  mkdir -p .molecule/roles
fi

rsync -av ../server/ .molecule/roles/nginx.server/