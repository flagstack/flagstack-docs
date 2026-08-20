# Python SDK

Repository: [`flagstack/sdk-python`](https://github.com/flagstack/sdk-python)

Requirements: Python 3.11 or newer.

The native SDK uses only the Python standard library at runtime. OpenFeature support is an optional extra.

!!! warning "Not yet published"
    The `flagstack` PyPI distribution is not yet released. The API below is implemented in the SDK repository and is still pre-release.

## Basic usage

```python
from flagstack import FlagStackClient

flags = FlagStackClient(
    base_url="https://flags.example.com",
    server_key="fs_server_...",
)

flags.initialize()

enabled = flags.get_boolean_value(
    "new-checkout",
    False,
    {
        "targetingKey": "user-123",
        "country": "GB",
        "plan": "enterprise",
    },
)
```

`initialize()` performs the initial refresh and starts background polling. Use `initialize(start_polling=False)` for short-lived processes.

## Lifecycle

Call `close()` during shutdown, or use the client as a context manager:

```python
with FlagStackClient(
    base_url="https://flags.example.com",
    server_key="fs_server_...",
) as flags:
    flags.initialize(start_polling=False)
    enabled = flags.get_boolean_value("new-checkout", False)
```

## Typed APIs

Python provides value and details methods for boolean, string, number and JSON flags. The details object exposes value, variant, reason, matching rule ID and error metadata.

## OpenFeature

The intended optional install is:

```bash
pip install "flagstack[openfeature]"
```

See [OpenFeature](openfeature.md) for provider usage.
