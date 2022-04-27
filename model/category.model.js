// const list=[
//     { CatID: 1, CatName: 'Laptop' },
//     { CatID: 2, CatName: 'Mobile' },
//     { CatID: 3, CatName: 'Quần áo' },
//     { CatID: 4, CatName: 'Giày dép' },
//     { CatID: 5, CatName: 'Trang sức' },
//     { CatID: 6, CatName: 'Khác' }
// ];
import db from '../utils/db.js';
import productModel from "../model/product.model.js";
export default {
  async findAll() {
    const list = await db.select().table('categories');

    for (let i = 0; i < list.length; i++) {
        const listsub = await db.select().table('categoriesnext').where({'CatID': list[i].CatID});
        list[i].listsub = listsub;
    }

    return list;
},
async findCategory() {
  const list = await db('categories').select();
  return list;
},

async findCategoryNext() {
  const list = await db('categoriesnext').select();

  for (const cat of list) {
      cat.amount = await productModel.countByCatIDNext(cat.CatIDNext);
      const Cat = await db('categories').where({CatID: cat.CatID});
      cat.NameParent = Cat[0].CatName;
  }
  return list;
},
async findByCatIDNext(CatIDNext) {

  if (CatIDNext === null)
      return null;

  const Cat = await db('categoriesnext').where({CatIDNext: CatIDNext})
  return Cat[0].CatNextName;
},
addCategory(category){
  return db('categories').insert(category);
},
patchMainCategory(category) {
  const CatId = category.CatID;
  delete category.CatID;
  return db('categories').update(category).where({'CatID': CatId});
},
addSubCategory(subCategory) {
  return db('categoriesnext').insert(subCategory);
},
patchSubCategory(subCategory) {
  const CatIdNext = subCategory.CatIDNext;
  delete subCategory.CatIDNext;
  return db('categoriesnext').update(subCategory).where({'CatIDNext': CatIdNext});
},
async delCatIDNext(CatIDNext) {
  // del following by step to avoid foreign key error
  const amount = await productModel.countByCatIDNext(CatIDNext);

  if (+amount === 0) {
      await db('categoriesnext').where({CatIDNext: CatIDNext}).del();
  }

},




async findCategoryNextID() {
  const id = await db('categoriesnext').count('CatIDNext as amount');
  return id[0].amount + 1;
},
async findCatIDByCatIDNext(CatIDNext) {
  const catID = await db('categoriesnext').where({CatIDNext: CatIDNext}).select('CatID');
  return catID[0].CatID;
},
async delCatID(CatID) {
  // del following by step to avoid foreign key error
  const sql = `SELECT COUNT(*) AS amount
               FROM products,
                  categories,
                    categoriesnext
               WHERE categories.CatID = categoriesnext.CatID
                 AND categoriesnext.CatIDNext = products.CatIDNext
                 AND categories.CatID = ${CatID}`

  const obj = await db.raw(sql);
  const amount = obj[0][0].amount;

  if (+amount === 0) {
      await db('categoriesnext').where({CatID: CatID}).del();
      await db('categories').where({CatID: CatID}).del();
  }

}


}
