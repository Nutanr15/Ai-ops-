# VM Health Check

A simple shell script to analyze the health of an Ubuntu virtual machine based on CPU, memory, and disk space utilization.

## Features

- Checks CPU, memory, and disk usage.
- Declares the VM as **Healthy** if all parameters are below 60% utilization.
- Declares the VM as **Not healthy** if any parameter exceeds 60% utilization.
- Supports an `explain` command-line argument to provide reasons for the health status.

## Usage

1. Clone this repository:
    ```bash
    git clone https://github.com/Nutanr15/ai-ops-.git
    cd ai-ops-
    ```

2. Make the script executable:
    ```bash
    chmod +x vm_health_check.sh
    ```

3. Run the script:
    ```bash
    ./vm_health_check.sh
    ```

4. Run with explanation:
    ```bash
    ./vm_health_check.sh explain
    ```

## Example Output

```
VM health status: Healthy
```
or
```
Reason(s) for not healthy status:
- CPU usage is 75% (above 60%)
VM health status: Not healthy
```

## Requirements

- Ubuntu Linux
- `bash`, `awk`, `free`, `top`, `df` utilities (default in most Ubuntu systems)

## License

MIT License
