# Reprise Bakery — website

Live at **https://reprisebakery.com**

Everything the site needs is in this folder. There is no build step and no
framework: the pages are plain HTML and all the styling is in one CSS file.

## The pages

| File | What it is |
|---|---|
| `index.html` | Home |
| `cheesecakes.html` | Our Cheesecakes (the menu) |
| `about.html` | Our Story |
| `ordering.html` | Ordering |
| `gallery.html` | From the Kitchen |
| `assets/site.css` | **All** styling for every page |

## To change wording

Open the page in any text editor, find the sentence, change it, save.
The nav, footer and the green order band are repeated in each page, so a
change to those has to be made in all five files.

## To change how something looks

It is all in `assets/site.css`. Colours are set once at the very top under
`:root` — change `--terracotta` there and it changes everywhere.

## To publish a change

    cd ~/Desktop/Reprise\ Bakery
    git add -A
    git commit -m "say what you changed"
    git push

The live site updates about a minute later. Every previous version is kept,
so nothing is ever lost.

## To swap a photo

Drop the new image into `assets/` using the same filename as the one it
replaces, then publish as above. To add gallery photos, put them in
`~/Desktop/reprise-photos` and run:

    ./scripts/prep-photos.sh ~/Desktop/reprise-photos

## Not published

`reference/`, `assets/originals/` and `cards/` stay on this machine only —
they are source material, not part of the website. Same for `README.txt`,
which holds build notes that should not be public.

## Still to do

- Prices on the Ordering page (currently says to ask for a quote)
- A phone number, if texting should be listed
- Check cottage food rules for the state before promoting orders widely
- Replace the AI photography with real photos as they are taken
