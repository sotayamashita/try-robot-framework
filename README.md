## Patterns

### Test with BrowserStack

**Requirements:**

```bash
# Install Robot Framework
pip install -U robotframework
# Install Robot Framework SeleniumLibrary
pip install -U robotframework-seleniumlibrary
# Install Local Testing binary
# https://www.browserstack.com/local-testing#command-line
```

**Run:**

```bash
# Start Local Testing
# See https://www.browserstack.com/local-testing
./BrowserStackLocal --key  <BrowserStack Key>
# Start robot test
robot -v Username:<Username> -v AccessKey:<AccessKey> --report /reports test-with-browserstack.robot
```
