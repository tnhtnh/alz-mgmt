#!/usr/bin/env python3

import sys
import json
import yaml
from jsonschema import validate, ValidationError
from pathlib import Path

def load_yaml(file_path):
    """Load YAML file and return dictionary."""
    try:
        with open(file_path, 'r') as file:
            return yaml.safe_load(file)
    except yaml.YAMLError as e:
        print(f"Error parsing YAML file: {e}")
        sys.exit(1)
    except FileNotFoundError:
        print(f"Could not find file: {file_path}")
        sys.exit(1)

def load_json_schema(file_path):
    """Load JSON schema file."""
    try:
        with open(file_path, 'r') as file:
            return json.load(file)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON schema: {e}")
        sys.exit(1)
    except FileNotFoundError:
        print(f"Could not find schema file: {file_path}")
        sys.exit(1)

def validate_config(config_path, schema_path):
    """Validate YAML config against JSON schema."""
    try:
        # Load the configuration and schema
        config = load_yaml(config_path)
        schema = load_json_schema(schema_path)

        # Perform validation
        validate(instance=config, schema=schema)
        print("✅ Configuration validation successful!")
        return True

    except ValidationError as e:
        print("❌ Configuration validation failed!")
        print(f"\nError: {e.message}")
        print(f"Path: {' -> '.join(str(p) for p in e.path)}")
        return False

def main():
    # Get the project root directory
    project_root = Path(__file__).parent.parent

    # Define paths relative to project root
    config_path = project_root / "tenant-config.yaml"
    schema_path = project_root / "tenant-config.schema.json"

    # Validate the configuration
    is_valid = validate_config(config_path, schema_path)
    
    # Exit with appropriate status code
    sys.exit(0 if is_valid else 1)

if __name__ == "__main__":
    main()