// const list=[
//     { CatID: 1, CatName: 'Laptop' },
//     { CatID: 2, CatName: 'Mobile' },
//     { CatID: 3, CatName: 'Quần áo' },
//     { CatID: 4, CatName: 'Giày dép' },
//     { CatID: 5, CatName: 'Trang sức' },
//     { CatID: 6, CatName: 'Khác' }
// ];
import db from '../utils/db.js';

export default {
  findAll() {
    return db('categories');
  },
  async findAllWithDetails(){
    const sql = `select c.*, count(p.ProID) as ProductCount from categories c left join products p on c.CatID = p.CatID group by c.CatID, c.CatName`;
    const raw = await db.raw(sql);
    return raw[0];
  },
  async findById(id) {
    const list= await db('categories').where('CatID', id);
    if (list.length === 0) 
       return null;
    return list[0];
  },

  add(entity) {
    return db('categories').insert(entity);
  },
  del(id){
    return db('categories').where('CatID',id).del();
  },
  patch(entity){
    const id=entity.CatID;
    delete entity.CatID;
    return db('categories').where('CatID',id).update(entity);
  }
}
