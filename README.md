# Campus Find — Lost & Found Portal

A responsive college mini-project for reporting, discovering, claiming, and returning lost items on campus.

## Features

- Report lost or found items
- Search and filter by report type and category
- View item details without exposing contact information
- Submit private ownership proof
- Review and approve claims
- Mark an item as returned
- Personal reports dashboard
- Responsive, keyboard-friendly interface
- Browser persistence using `localStorage`

## Run the project

No installation is required.

1. Extract the ZIP file.
2. Open `index.html` in Chrome, Edge, or Firefox.
3. Use **Reset demo data** to restore the sample reports.

For a local development server, run one of the following inside the project folder:

```bash
python3 -m http.server 8000
```

Then open `http://localhost:8000`.

## Demo flow

1. Select **Report lost item** or **I found something**.
2. Complete the form and publish it.
3. Open a report and select **This may be mine** to submit a private claim.
4. Open **Claims** to review a claim attached to one of your found-item reports.
5. Approve it to mark the item as returned.

## Project structure

- `index.html` — page structure and dialogs
- `styles.css` — responsive visual design
- `app.js` — application logic and local data storage
- `database.sql` — optional MySQL schema for a future server-backed version

## Suggested viva explanation

The portal solves the problem of fragmented lost-and-found communication across chat groups and notice boards. It separates public item information from private ownership proof. The current MVP stores data locally so it can be demonstrated without configuration. In a production version, the same entities can be moved to MySQL and protected by college-email authentication.

## Production improvements

- College email authentication
- MySQL/API backend
- Image upload and moderation
- Email notifications for possible matches
- Role-based administration
- Rate limiting and audit logs

## Academic note

This source is intended as a foundation. Update the college name, project report, screenshots, and acknowledgements before submission.
