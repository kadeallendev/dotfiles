return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yaml.github-action', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },
  root_markers = { '.git' },
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/github-action.json"] = "/.github/actions/*",
        ["https://artillery.io/schema.json"] = "*loadtest*.y*ml"
      },
      format = {
        singleQuote = true
      },
      hover = true
    },
    redhat = { telemetry = { enabled = false } }
  }
}
