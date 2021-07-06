This action will keep your remote personal webspace in sync with a GitHub repository.

**Note**: the entire `public/html` directory is replaced; remote files will be deleted if they are not present in GitHub.

There are two environment variables that must be set:

1. `UNIQNAME` which can be a simple string
2. `SSHPASS` which must be created as an [encrypted secret](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository)

Example `.github/workflows/main.yml`
```yml
on:
  push:
    branches:
      - master
jobs:
  deploy:
    runs-on: ubuntu-latest
    name: checkout and rsync
    steps:
      - uses: actions/checkout@v2
      - uses: dctalbot/umich-afs-action@v2
        with:
          workspace-path: 'build'
        env:
          UNIQNAME: 'dctalbot'
          SSHPASS: ${{ secrets.SSHPASS }}
```
