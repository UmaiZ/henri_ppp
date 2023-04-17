const request = require('supertest');
const app = require('../../index');
const path = require('path');

// Const Run Server Before Test
beforeAll(async () => {
  await app
  console.log('Jest starting!');
});
const testImag = path.resolve(__dirname, '../images/testImag1.png');

// jest.mock('multer', () => {
//   const multer = () => ({
//     any: () => {
//       return (req, res, next) => {
//         req.body = { userName: 'testUser' }
//         req.files = [
//           {
//             fieldname: "image",
//             originalname: 'testImag1',
//             mimetype: 'png',
//             path: 'test\images\testImag1.png',
//             buffer: Buffer.from('../images/testImag1.png'),
//           },
//         ]
//         return next()
//       }
//     },
//   })
//   multer.memoryStorage = () => jest.fn()
//   return multer
// })


describe('POST /createNewsFeed', () => {
  it("Should Throw Error WithOut Token", async () => {
    const res = await request(app).post('/createNewsFeed').send({
      "title": "Test Title",
      "description": "Test Description",
    })
    expect(res.statusCode).toEqual(401);
    expect(res.body).toHaveProperty('success', false);
    expect(res.body).toHaveProperty('message', 'A token is required for authentication');
  });
  it("Should Throw  Error WithOut Title", async () => {
    const res = await request(app).post('/createNewsFeed')
      .field('title', '')
      .field('description', 'Test Description')
      // .attach('image', testImag)
      .set(
        'x-access-token',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjNkZDM4NjAzNTUwNzIyZDAxMzFmYWJjIiwiaWF0IjoxNjc3MTQ3MTg0LCJleHAiOjE2Nzc3NTE5ODR9.OlLPjSlkQuv5Be6ajZNWG52Kc1UvaAfnWo23_GN7Cnw')
    console.log(res);
    expect(res.statusCode).toEqual(400);
    expect(res.body).toHaveProperty('success', false);
    expect(res.body).toHaveProperty('message', 'Title and Description are required');
  });
  it("Should Throw  Error WithOut description", async () => {
    const res = await request(app).post('/createNewsFeed')
      .field('title', 'test title')
      .field('description', '')
      // .attach('image', testImag)
      .set(
        'x-access-token',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjNkZDM4NjAzNTUwNzIyZDAxMzFmYWJjIiwiaWF0IjoxNjc3MTQ3MTg0LCJleHAiOjE2Nzc3NTE5ODR9.OlLPjSlkQuv5Be6ajZNWG52Kc1UvaAfnWo23_GN7Cnw')
    expect(res.statusCode).toEqual(400);
    expect(res.body).toHaveProperty('success', false);
    expect(res.body).toHaveProperty('message', 'Title and Description are required');
  });
  it("Should Throw  Error WithOut Image", async () => {
    const res = await request(app).post('/createNewsFeed')
      .field('title', 'test title')
      .field('description', 'test title')
      // .attach('image', testImag)
      .set(
        'x-access-token',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjNkZDM4NjAzNTUwNzIyZDAxMzFmYWJjIiwiaWF0IjoxNjc3MTQ3MTg0LCJleHAiOjE2Nzc3NTE5ODR9.OlLPjSlkQuv5Be6ajZNWG52Kc1UvaAfnWo23_GN7Cnw')
    expect(res.statusCode).toEqual(400);
    expect(res.body).toHaveProperty('success', false);
    expect(res.body).toHaveProperty('message', 'Image is required');
  });
});
