import db from '../utils/db.js'
import moment from "moment";

export default {
    addAccount(account) {
        return db('users').insert(account);
    },
    updateInfoAccount(info) {
        const username = info.username;
        delete info.username;
        return db('users').where('username', username).update(info);
    },
    async findByUsername(username) {
        const list = await db('users').where('username', username);

        if (list.length === 0)
            return null;

        return list[0];
    },

    async findByEmail(email) {
        const list = await db('users').where('email', email);

        if (list.length === 0)
            return null;

        return list[0];
    },

    async findAll(){
        return db('users');
    },

    async degradeAccount(username){
        await db('users')
            .where({ username: username})
            .update({ level: 'bidder' });
        await db('upgrade')
            .where({ id: username})
            .update({ isCancel: 1 })
    },

    
    async getNameByUsername(username){
        const obj = await db('users').where('username',username).select('name');
        return obj[0].name;
    },

    
    async lockAccount(username) {
        await db('users')
            .where({ username: username})
            .update({ isLock: 1 })
    },
    async unlockAccount(username) {
        await db('users')
            .where({ username: username})
            .update({ isLock: 0 })
    },
    async deleteAccount(username) {
        await db('users')
            .where({username: username})
            .delete()
    },

   

}