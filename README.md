# nix-xdm

A nix derivation for [Xtreme Download Manager](https://github.com/subhra74/xdm) 

## Usage

As of now this derivation has not been published on any repository. You can build it locally by running the following command:

```bash
git clone git@github.com:Diomeh/nix-xdm.git
cd nix-xdm
nix-build
```

The derivation will be built and the output will be in the `result` symlink.

Then you can run the application by running:

```bash
./result/xdman
```

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/Diomeh/nix-xdm/blob/master/LICENSE) file for details.

## Author

[David Urbina](https://github.com/Diomeh)

## Contributing

Contributions are welcome! Feel free to submit a pull request or open an issue if you have any suggestions or feedback.

This project follows the [Contributor Covenant Code of Conduct](https://github.com/Diomeh/nix-xdm/blob/master/CODE_OF_CONDUCT.md)
and the [Conventional Commits Specification](https://www.conventionalcommits.org/en/v1.0.0/).

### Commit Message Format

From the Conventional Commits Specification [Summary](https://www.conventionalcommits.org/en/v1.0.0/#summary):

The commit message should be structured as follows:

```plaintext
{type}[optional scope]: {description}

[optional body]

[optional footer(s)]
```

Where `type` is one of the following:

| Type              | Description                                                                                             | Example Commit Message                            |
|-------------------|---------------------------------------------------------------------------------------------------------|---------------------------------------------------|
| `fix`             | Patches a bug in your codebase (correlates with PATCH in Semantic Versioning)                           | `fix: correct typo in README`                     |
| `feat`            | Introduces a new feature to the codebase (correlates with MINOR in Semantic Versioning)                 | `feat: add new user login functionality`          |
| `BREAKING CHANGE` | Introduces a breaking API change (correlates with MAJOR in Semantic Versioning)                         | `feat!: drop support for Node 8`                  |
| `build`           | Changes that affect the build system or external dependencies                                           | `build: update dependency version`                |
| `chore`           | Other changes that don't modify src or test files                                                       | `chore: update package.json scripts`              |
| `ci`              | Changes to CI configuration files and scripts                                                           | `ci: add CircleCI config`                         |
| `docs`            | Documentation only changes                                                                              | `docs: update API documentation`                  |
| `style`           | Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc.) | `style: fix linting errors`                       |
| `refactor`        | Code change that neither fixes a bug nor adds a feature                                                 | `refactor: rename variable for clarity`           |
| `perf`            | Code change that improves performance                                                                   | `perf: reduce size of image files`                |
| `test`            | Adding missing tests or correcting existing tests                                                       | `test: add unit tests for new feature`            |
| Custom Types      | Any other type defined by the project for its specific needs                                            | `security: address vulnerability in dependencies` |

For more information, refer to the [Conventional Commits Specification](https://www.conventionalcommits.org/en/v1.0.0/).
