## Patterns

### Test with BrowserStack

Setup:

1. Sign up for a BrowserStack free trial account.
    - https://www.browserstack.com/users/sign_up
1. Install Robot Framework itself and libraries:

    ```bash
    pip install -U robotframework
    pip install -U robotframework-seleniumlibrary
    ```
1. Install Local Testing binary
    - https://www.browserstack.com/local-testing#command-line

Run:

```bash
# Start Local Testing
./BrowserStackLocal --key  <BrowserStack Key>
# Start robot test
robot -v Username:<Username> -v AccessKey:<AccessKey> --report /reports test-with-browserstack.robot
```
