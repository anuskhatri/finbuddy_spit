// components/SideNavCard.js
"use client";
import React from 'react';
import { useRouter } from 'next/navigation';

const SideNavCard = ({ data }) => {
    const router = useRouter();

    return (
        <div className=' md:mt-16'>
            {data?.map((item) => (
                <div
                    key={item.name}
                    className='w-full cursor-pointer h-12 flex justify-center items-center my-4   text-black bg-[#f1f5fb] text-sm rounded-md'
                    onClick={() => router.push(`/dashboard${item.link}`)}
                >
                    {item.name}
                </div>
            ))}
            <div className='relative '>
                <div

                    className='w-full h-12 flex justify-center items-center my-4   text-black bg-[#f1f5fb] text-sm rounded-md'
                    onClick={() => router.push(`/dashboard${item.link}`)}
                >
                    Logout
                </div>
            </div>

        </div>
    );
};

export default SideNavCard;
