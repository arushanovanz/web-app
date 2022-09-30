import functools

import posts as posts
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

from flaskr.db import get_db

bp = Blueprint('search', __name__, url_prefix='/search')


@bp.route('/search', methods=('GET', 'POST'))
def search():
    if request.method == 'GET':
        db = get_db()
        error = None

        if error is None:
            try:
                db.execute(
                    "Select r.name, r.open_time, r.close_time, d.address, d.average_bill, d.average_rating"
                    " from  restaurant r inner join description d"
                    " on d.id = r.id_description "
                    "where d.date_close = null and d.date_open >= CURRENT_TIMESTAMP"
                    " ORDER BY created DESC").fetchall()
                return render_template('/search', posts=posts)

            except db.IntegrityError:
                error = f"There was an error during search"
        flash(error)

    return render_template('search_page/search.html')
