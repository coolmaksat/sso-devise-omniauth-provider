case "$TARGET" in
    debian* | ubuntu*)
        fpm_depends+=('libpq-dev' 'nginx | apache2')
        ;;
    centos*)
        fpm_depends+=('postgresql-devel')
        ;;
esac

# Exclude all files and directories matched by .gitignore
for i in `git status --ignored --porcelain |grep '^!!' |sed -e 's/^!! //' |grep -v git-commit.version |grep -v vendor/bundle`; do
  fpm_exclude+=("var/www/arvados-sso/current/$i")
done
