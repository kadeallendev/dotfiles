return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yaml.github-action', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },
  root_markers = { '.git' },
  settings = {
    yaml = {
      schemas = {
        ["https://schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://schemastore.org/github-action.json"] = "/.github/actions/*",
      }
    },
    redhat = { telemetry = { enabled = false } }
  }
}
