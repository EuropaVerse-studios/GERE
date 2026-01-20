# Pull Request Example

This document is a **complete example of a professional Pull Request** for contributors to follow.  
It uses the **GERE Loading Screen PR** as an example, but can be adapted for any feature or fix.

## Example PR

**Branch:** `dev` → **Main branch:** `main`

**PR Title:**  

Add Loading Screen with fade-in/out sequence and random quotes

**PR Description:**  

Summary

This PR adds a fully functional loading screen for GERE. It includes:

- Fade-in → stay → fade-out for all UI elements
- Random quote display from quotes.txt
- Logo and "Powered by Godot Engine" sequence
- "Press any key to continue" functionality
- Compatible with Godot 4.5 using modern await and Tween API

Why

- Improves user experience during game startup
- Provides a clear template for future loading screens
- Demonstrates proper use of async await with Tween in Godot 4.5

How to Test

- Checkout the dev branch
- Open LoadingScreen.tscn in Godot
- Run the scene and verify:
    All elements appear in sequence with fade-in/out
    A random quote is displayed
    The last prompt waits for any key press before changing scene
- Confirm that no errors appear in the console

Checklist (to help reviewers)

- Code follows GERE project coding style
- All features have been tested locally
- quotes.txt exists in res:// with at least one quote
- Scene changes work correctly when pressing a key
- Tween animations run smoothly in Godot 4.5

Notes

- This loading screen serves as a template for future features
- Animation durations can be adjusted in _ready() if needed
- Any future changes should be documented and reviewed in PR

## Explanation of PR Sections

**Summary** Briefly explains what the PR does and the main features added. 
**Why** Explains the reason for this PR: why the feature/fix is needed. 
**How to Test** Provides clear steps for reviewers to test the PR locally. 
**Checklist** Ensures quality, coding style, and testing. Helps maintain consistency. 
**Notes** Any extra info, instructions, or warnings about the PR. 

## Best Practices for PRs

1. **Use clear, descriptive titles** – avoid vague titles like "Update code".  
2. **Be concise but informative** in the description. Include screenshots or examples if possible.  
3. **Use checklists** – makes it easy for reviewers to confirm testing and style guidelines.  
4. **Label your PR** – e.g., `feature`, `bugfix`, `UX/UI`, `ready for review`.  
5. **Reference related issues or tasks** if any.  
6. **Test your PR locally** before submitting – make sure nothing breaks.  
7. **Keep commits clean** – squash small fix commits if needed.  

## Notes for New Contributors

- You can **copy this PR template** when submitting a new PR.  
- Replace the summary and testing instructions with your own feature/fix details.  
- Always update the checklist and labels accordingly.  
- This markdown file is a **living document** – it can be updated as the project standards evolve.  

> By following this template, PRs will be **professional, easy to review, and consistent**, making it easier for ever
