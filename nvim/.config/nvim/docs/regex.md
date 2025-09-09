# Vim Regex

## Lookaround Assertions

### Start and End of the Matched Pattern

| Metacharacter | Description                                                                                                      |
|---------------|------------------------------------------------------------------------------------------------------------------|
| `\zs`         | Set the start of the match after `\zs`; the pattern before it will need to be in the text, but won't be matched. |
| `\ze`         | Set the start of the match after `\ze`; the pattern after it will need to be in the text, but won't be matched   |

### Lookahead and Lookbehind

| Metacharacters            | Type                | Description                                                          |
|---------------------------|---------------------|----------------------------------------------------------------------|
| (`<pattern>`)@<=`<match>` | Positive lookbehind | `<match>` will be matched only if `<pattern>` precedes it.           |
| `<match>`(`<pattern>`)@=  | Positive lookahead  | `<match>` will be matched only if `<pattern>` follows it.            |
| (`<pattern>`)@<!`<match>` | Negative lookbehind | `<match>` will be matched only if `<pattern>` **doesnt** precede it. |
| `<match>`(`<pattern>`)@!  | Negative lookahead  | `<match>` will be matched only if `<pattern>` **doesn't** follow it. |
