export function auth(req, res, next) {
    if (req.session.auth === false) {
        req.session.retUrl = req.originalUrl;
        return res.redirect('/account/login')
    }
    next();
}

export function activeEmail(req, res, next) {
    if (req.session.authAccount.isActive === 1) {
        return res.redirect('/info/reviewProfile')
    }
    next();
}
export function authAdmin(req, res, next) {
    if (req.session.auth === false) {
        req.session.retUrl = req.originalUrl;
        return res.redirect('/account/login')
    } else if (req.session.authAccount.role === 'user' ) {
        const url = '/';
        return res.redirect(url);
    }

    next();
}
