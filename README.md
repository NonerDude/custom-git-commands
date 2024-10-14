# 🚀 Custom Git Commands for a Smoother Workflow

## Welcome to Custom Git Commands! If you’re tired of typing out long Git commands every time you work, or just want to speed things up with a few shortcuts, you’re in the right place. Here’s a collection of my favorite Git commands that I’ve packaged up to make life easier.

These commands do things like fast-checkouts, checking the last branches you’ve been working on, and showing your current branch in style.

How to Use This Repo

You can either:

	1.	Add these Git aliases quickly by running the one-liner commands generated for each script (check out the oneline-configs folder).
	2.	Explore the scripts and use them manually if you like tweaking things or want to know exactly what’s happening.

Either way, these commands are designed to simplify your Git workflow without adding any extra complexity. And yes, they are 100% safe—no messing with your history unless you ask for it. 😏

# Commands Breakdown

Here’s a quick rundown of what each command does:

## ⚡ fast-checkout

Command alias: git chf <branch-substring>

You ever forget the exact branch name? Happens to all of us. With fast-checkout, you can just type a part of the branch name and Git will do the hard work of finding it. If there’s more than one match, it’ll show you the options. It’s like Git, but faster.

## 🔄 last-branches

Command alias: git lbr

This command shows you the last few branches you’ve checked out recently, so you don’t have to dig through git log to remember where you’ve been. It even has some cool options:

	•	-r: Show them in reverse order.
	•	-u: Remove duplicates.
	•	-n <number>: Control how many branches to show (default is 5).

## 📍 current-branch

Command alias: git cu

Need a quick glance at your current branch? current-branch shows it with a splash of color. It’s nothing fancy, but it saves a few keystrokes and makes you look good in the terminal.

Setting Up

To use these commands, you can either:

1.	Run the one-liner:
Just run the one-liner git config commands stored in the oneline-configs/ folder.

2.	Clone this repo:

Clone the repository locally and manually add the aliases to your Git config. Here’s how you can do it:

1.	Clone the repo:
   
		git clone https://github.com/NonerDude/custom-git-commands.git
		cd custom-git-commands
2.	Open any .sh file from the bash-scripts/ folder (e.g., fast-checkout.sh), and manually add it to your Git config. For example, to set up the fast-checkout command:
   
		git config --global alias.chf '!bash path/to/fast-checkout.sh'
3.	Repeat for other scripts to add more aliases. Now, you can use the commands in your terminal like any normal Git command.
