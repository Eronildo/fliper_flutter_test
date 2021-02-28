# A Fliper Flutter Challenge

Create the card "Your Summary" from the feed of the new Fliper application, consuming the data from the GraphQL endpoint.

## Guidelines:

- The project must be done in flutter.
- We expect some state management alternative.
- Feel free to dare in the project.

# Installation

To run this project, you will need to copy, paste and rename a `app_config.json.template` to `app_config.json` placed in the `assets/configs` directorie:

```
project/
  pubspec.yaml
  README.md << This readme
  assets/
    configs/
        app_config.json  << Where to place the file
  lib/
```

The content of this file looks like this:

```json
{
  "graphql_end_point": "YOUR_GRAPHQL_END_POINT",
  "hasura_secret": "YOUR_HASURA_SECRET"
}
```

Where `graphql_end_point` and `hasura_secret` are obtained with the Fliper Team.

<p align="center">
  <img src="https://github.com/Eronildo/fliper_flutter_test/blob/master/flutter_01.png" title="Your resume card" width="250">
  <img src="https://github.com/Eronildo/fliper_flutter_test/blob/master/flutter_02.png" title="Resume blurred" width="250">
  <img src="https://github.com/Eronildo/fliper_flutter_test/blob/master/flutter_03.png" title="Home Drawer" width="250">
</p>
