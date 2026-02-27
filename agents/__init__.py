from .scanner import ScannerAgent
from .architect import ArchitectAgent
from .cleaner import CleanerAgent

def run_orchestration(target_dir="."):
    """Orchestrates the multi-agent workflow."""
    print("🚀 Starting AI Debt Scanner Orchestration...\n")
    
    # 1. Scanner Agent
    scanner = ScannerAgent(target_dir)
    toon_report = scanner.audit(format="toon")
    print(toon_report)
    print("-" * 40)
    
    # 2. Architect Agent
    architect = ArchitectAgent()
    plans = architect.plan_refactoring(toon_report)
    
    print("📐 Architect Plan:")
    for plan in plans:
        print(f"  - [{plan['file']}] -> {plan['action']}")
    print("-" * 40)
    
    # 3. Cleaner Agent(s)
    cleaner = CleanerAgent()
    for plan in plans:
        cleaner.apply_fixes(plan['file'], "Hotspots from TOON...")

if __name__ == "__main__":
    run_orchestration("tests/vibe_debt_sample.ts")
