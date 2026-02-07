from fastmcp import FastMCP
from pathlib import Path

# Initialize FastMCP server
mcp = FastMCP("Jimdo Content Engine")

# Constants
DATA_DIR = Path(__file__).parent / "data"
GUIDELINES_PATH = DATA_DIR / "brand_guidelines.md"
TEMPLATES_DIR = DATA_DIR / "templates"

def load_text(path: Path) -> str:
    """Load text from a file, returning empty string if not found."""
    try:
        return path.read_text(encoding="utf-8").strip()
    except FileNotFoundError:
        return ""

def get_available_templates() -> list[str]:
    """Return a list of available template names (based on filenames)."""
    if not TEMPLATES_DIR.exists():
        return []
    return [f.stem for f in TEMPLATES_DIR.glob("*.md")]

@mcp.tool()
def get_content_strategy(asset_type: str) -> str:
    """
    Get the content strategy and template for a specific asset type.
    
    Args:
        asset_type: The type of asset to generate strategy for. 
                    (e.g., 'blog', 'email', 'social')
    
    Returns:
        A string containing the brand guidelines and the specific template.
    """
    # Normalize input
    asset_key = asset_type.lower().strip()
    template_path = TEMPLATES_DIR / f"{asset_key}.md"
    
    if not template_path.exists():
        available = ", ".join(get_available_templates())
        return f"Error: Asset type '{asset_type}' not found. Available types: {available}."
    
    # Load content
    guidelines = load_text(GUIDELINES_PATH)
    template = load_text(template_path)
    
    return f"""
--- BRAND GUIDELINES ---
{guidelines}

--- {asset_type.upper()} TEMPLATE ---
{template}
"""

if __name__ == "__main__":
    mcp.run()
